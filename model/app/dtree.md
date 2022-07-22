> Create and evaluate a decision tree for decision analysis

To create and evaluate a decision tree first (1) enter the structure of the tree in the input editor or (2) load a tree structure from a file. When you first navigate to the _Model > Decide > Decision analysis_ tab you will see an example tree structure. This structure is based on an <a href="https://github.com/gluc/useR15/blob/master/00_data/jennylind.yaml" target="_blank">example</a> by Christoph Glur, the developer of the <a href="https://github.com/gluc/data.tree" target="_blank">data.tree</a> library.

To enter a new structure, start by providing a name for the tree and enter a label in the input box next to the `Calculate` button. In the example below the name for the decision tree is entered as follow: `name: Sign contract`. The next step is to indicate the **type** of the first **node**. Options are `type: decision` or `type: chance`. Note that we are skipping `variables` for now but will return to this section below.

In the provided example, the first node is a **decision node**. The decision maker has to decide to `Sign with Movie Company` or `Sign with TV Network`. The first option leads to a **chance** node with probabilities and payoffs. The second has a fixed payoff.

> **Note:** Indentation is critically important when defining a tree structure. Use tabs to create branches as shown in the example. Names for branches **must** be followed by a `:` and information about the branch **must** be indented using the `tab` key.

After providing the name for the decision `Sign with Movie Company`, the next line **must** be indented using the `tab` key. In the example, the next line starts the description of a chance node (`type: chance`). There are 3 possibilities in the example: (1) `Small Box Office`, (2) `Medium Box Office`, and (3) `Large Box Office`, each with a probability and a payoff. These are end-points for one branch of the tree and are often referred to as `terminal nodes` or `leaves`. All endpoints must have a `payoff` value.

> **Note:** Probabilities for a chance node should sum to 1 and all probabilities must be between 0 and 1.

A decision can also be assigned a `cost`. For example, if we decide to sign with the movie studio we may incur a cost of $5,000 for legal support. Assume the contract with the TV network is simpler and does not require legal assistance. Note that using `costs` is optional. In the example we could also subtract \$5,000 from each of the possible box-office payoffs.

If some values in the tree are related or repeated it can be useful to use a `variables` section. Here you can assign labels to values, enter formulas, and even reference other (sub)trees. Note that formulas should only reference entries from the `variables` section and cannot contain any R-commands. In the `Sign contract` example only one variable is created (i.e., `legal fees`). The _Sensitivity_ tab requires that a `variables` section is included in the tree structure. An adapted version of the `Sign contract` example that uses more variables and a formula is shown below.


```yaml
name: Sign contract
variables:
    legal fees: 5000
    P(small): 0.3
    P(medium): 0.6
    P(large): 1 - P(small) - P(medium)
type: decision
Sign with Movie Company:
    cost: legal fees
    type: chance
    Small Box Office:
        p: P(small)
        payoff: 200000
    Medium Box Office:
        p: P(medium)
        payoff: 1000000
    Large Box Office:
        p: P(large)
        payoff: 3000000
Sign with TV Network:
    payoff: 900000
```

To reference another (sub)tree use the `dtree` function in the `variables` section and the name of the (sub)tree. For example, suppose you want to include a tree ("tuesday_tree") that evaluates a pricing decision on Tuesday into a tree that evaluates a pricing decision on Monday. The start of the `variables` section might look as follows:

```yaml
variables:
  tuesday_emv: dtree("tuesday_tree")
```

Then in the Monday tree you would refer to `tuesday_emv` in spots where you need the EMV from Tuesday's pricing decision.

## Rules for decision tree input

1. Always start with a tree name (e.g., `name: My tree`)
2. The second line should start a `variables` section or a node definition (i.e., type: chance or type: decision)
3. All lines must have a `:`. For node names the `:` ends the line. For all other lines it assigns a value.  Specifically, it assigns a name (e.g., `name: My tree`), a node type (e.g., `type: decision`), a variable (e.g., `legal fees: 5000`), or a number (e.g., `payoff: 100`, `p: 0.1`, `cost: 10`)
4. A node type must be followed on the next line by a node name (e.g., `Cancel orders:`)
5. Use only letters and spaces in node names (i.e., no symbols)
6. The line after a node name must **always** be indented
7. End (or terminal or leave) nodes must have a payoff (e.g., `payoff: 100`)
8. If linked to a chance node, terminal nodes must have a probability (e.g, `p: 0.4`) and a payoff

After specifying the tree structure in the editor, press the `Calculate` button to see the `Initial` and `Final` decision tree in text format on the right side of the screen (see screen shot below). The initial tree simply shows the tree structure that was specified, together with the node types, probabilities, costs, and payoffs. The final tree shows the optimal decision strategy determined by `folding-back` the tree. In this case, the optimal decision is to `Sign with Movie Company` because this decision has a higher **Expected Monetary Value (EMV)**.

<p align="center"><img src="figures_model/dtree_model.png"></p>

For a visual representation of the decision tree open the _Plot_ tab. If you already clicked the `Calculate` button in the _Model_ tab you will see a graph of the `Initial` decision tree (see screen shot below). Decision nodes are shown in green and chance nodes in orange. If the tree does not look as you intended/expected, return to the _Model_ tab and edit the tree structure.

<p align="center"><img src="figures_model/dtree_plot_initial.png"></p>

The `Final` graph shows the optimal decision determined by `folding-back` the tree. The optimal decision is to `Sign with Movie Company` because this decision has a higher **Expected Monetary Value**. Note that the optimal decision at each decision node is shown by a thicker line connecting to the nodes.

<p align="center"><img src="figures_model/dtree_plot_final.png"></p>

The EMV for `Sign with TV Network` is \$900,000. If we ignore costs the expected payoff from `Sign with Movie Company` is:

$$
  0.3 \times 200,000 + 0.6 \times 1,000,000 + 0.1 \times 3000,000 = 960,000
$$

The EMV from signing with the movie company is however $960,000 - 5,000 = 955,000$ because we do incur a cost of \$5,000 in legal fees. Hover the cursor over the chance node shown on screen to see a `tooltip` that shows the calculation. To highlight that a `cost` was specified the chance node in the figure has a dashed outer line.

In the `Sign contract` example it is clear that `Sign with Movie Company` is the preferred option. However, suppose the legal fees associated with this option were $10,000, or $30,000, would we still choose the same option? This is where the _Sensitivity_ tab is useful. Here we can evaluate how decisions (e.g., `Sign with Movie Company` and `Sign with TV Network`) would change if the legal fee changes. Enter 0 as the `Min` value, 80000 as the `Max value`, 10000 as the `Step` size, and then press the <i class="fa fa-plus"></i> icon. After pressing `Evaluate sensitivity` a graph will be shown that illustrates how payoffs for the decisions change. Notice that for legal fees higher than \$60,000 `Sign with TV Network` produces the highest EMV.

<p align="center"><img src="figures_model/dtree_sensitivity.png"></p>

## Video Tutorials

Copy-and-paste the full command below into the RStudio console (i.e., the bottom-left window) and press return to gain access to all materials used in the decision tree module of the <a href="https://www.youtube.com/playlist?list=PLNhtaetb48EdKRIY7MewCyvb_1x7dV3xw" target="_blank">Radiant Tutorial Series</a>:

<pre>usethis::use_course("https://www.dropbox.com/sh/bit4p1ffbkb2dgh/AACm1RVy2BxBDiVbjoLiN5_Ea?dl=1")</pre>

<a href="https://youtu.be/plSeVJ7c-Iw" target="_blank">Introduction to Decision Analysis (#1)</a>

* This video walks you through the required steps to construct and solve a basic decision tree by hand
* Topics List:
    - Chance nodes vs. decision nodes
    - Folding back the tree (i.e., start from the right-most nodes and work backwards to the left-most nodes)

<a href="https://youtu.be/dBySH3z2Paw" target="_blank">Using Radiant to Construct a Decision Tree (#2)</a>

* This video demonstrates how to construct a basic decision tree in Radiant
* Topics List:
    - Rename a tree file
    - Construct a tree (following the rules for decision tree input)
    - Interpret the results (initial tree vs final tree)
    - Save the decision tree input .yaml file

<a href="https://youtu.be/NlvWCU8UhTc" target="_blank">How to Write Decision Tree Results into a Report (#3)</a>

* This video demonstrates how to construct a basic decision tree in Radiant and add the generated R-code to a report
* Topics List:
    - Construct a decision tree and define variables in the decision tree
    - Add multiple trees to a report
    - Demo some useful keyboard shortcuts
    - Save the Radiant state file and the report

<a href="https://youtu.be/c_pCCCn6FEw" target="_blank">Sensitivity Analysis of Decision Tree (#4)</a>

* This video shows two ways to conduct sensitivity analysis of a decision tree in Radiant
* Topics List:
    - Quick review of writing decision tree results to a report
    - Method 1: manually update the value
    - Method 2: use "variables"

<a href="https://youtu.be/oiwv15bbjzs" target="_blank">How to Debug Decision Tree Input (#5)</a>

* This video demonstrates how to debug decision tree input if you get an error message
* Topics List:
    - Colon missing
    - Indent issue
    - Probabilities don't sum to 1
    - Value missing

<a href="https://youtu.be/xuv9zgAcvCQ" target="_blank">Decision Trees with Imperfect Information (#6)</a>

* This video shows how to determine the appropriate (conditional) probabilities to use in a decision tree when the available information is imperfect
* Topics List:
    - Imperfect information
    - Test
    - Conditional probabilities

<a href="https://youtu.be/cVrYFFX3xN0" target="_blank">Solving a Decision Tree with Imperfect Information (#7)</a>

* This video shows how to use Radiant to construct and solve a decision tree when the available information is imperfect
* Topics List:
    - Specify variables
    - Build a tree with imperfect information
    - Check the tree
    - Interpret the decision tree result

<a href="https://youtu.be/Mi-eZEoU9TE" target="_blank">Building a Decision Tree with Sub-trees in Radiant (#8)</a>

* This video shows how to build a decision tree with sub-trees in radiant
* Topics List:
    - Create a main tree that references a sub-tree
    - Specify a sub-tree that references the main tree in the variables section

For the full "Radiant Tutorial Series" see the link below:

<a href="https://www.youtube.com/playlist?list=PLNhtaetb48EdKRIY7MewCyvb_1x7dV3xw" target="_blank">https://www.youtube.com/playlist?list=PLNhtaetb48EdKRIY7MewCyvb_1x7dV3xw</a>

## Buttons

In the _Model_ tab:

* To see this help file click the <i class="fa fa-question" ></i> icon
* To generate a report about the decision tree in the _Report > Rmd_ tab click the <i class="fa fa-edit" ></i> icon or press `ALT-enter` on your keyboard 
* Choose to maximize (`Max`) or minimize (`Min`) payoffs. Note that payoffs can be negative
* Click the `Calculate` button or press `CTRL-enter` (`CMD-enter` on mac) to generate or update results
* Specify a name for your decision tree in the text input next to the `Calculate` button. Clicking on the `Calculate` button will store your settings. If multiple tree structures are available there will also be a dropdown where you can select which structure to use and a `Remove` button to delete tree structures
* To save the tree structure entered into the editor window to disk press the `Save input` button
* To save the text representation of the initial and final tree to a file click the `Save output` button
* To load a tree structure from a file in `yaml` format click the `Choose File` button

In the _Plot_ tab:

* To see this help file click the <i class="fa fa-question" ></i> icon
* To generate a report about the decision tree in the _Report > Rmd_ tab click the <i class="fa fa-edit" ></i> icon or press `ALT-enter` on your keyboard
* Show either the `Initial` or `Final` decision tree
* Click the `Calculate` button or press `CTRL-enter` (`CMD-enter` on mac) to generate or update results
* Enter the number of decimal places to show in the plot (default is 2 for payoffs and 4 for probabilities)
* Provide a symbol to use for the payoffs (e.g., $ or RMB)
* Click the download icon in the top right of your browser to download either the initial or final plot to png file

It is not currently possible to add a title or caption directly to the `Decision Tree` plot.

In the _Sensitivity_ tab:

* To see this help file click the <i class="fa fa-question" ></i> icon
* To generate a report about the decision tree in the _Report > Rmd_ tab click the <i class="fa fa-edit" ></i> icon or press `ALT-enter` on your keyboard
* Select one or more `Decisions to evaluate`
* Select variables in `Sensitivity to changes in`. These variables must be defined in the `variables` section of the decision tree structure in the _Model_ tab
* Enter the minimum, maximum, and step size for the selected variable and press the <i class="fa fa-plus"></i> icon
* Press `Evaluate sensitivity` or press `CTRL-enter` (`CMD-enter` on mac) to generate results and the plot
* Click the download icon in the top right of your browser to download the plot to a png file

If a sensitivity plot was created it can be customized using `ggplot2` commands (see example below). See <a href="https://radiant-rstats.github.io/docs/data/visualize.html" target="_blank">_Data > Visualize_</a> for details.

```r
sensitivity(
  result, 
  vars = "legal fees 0 100000 1000;", 
  decs = c("Sign with Movie Company", "Sign with TV Network"), 
  custom = TRUE
) + labs(caption = "Based on example created by ...")
```

## The decision tree editor

Useful keyboard short-cuts:

* Comment current or selected line(s) (Win: Ctrl-/ Mac: Cmd-/)
* Fold all lines (Win: Alt-0 Mac: Alt-Cmd-0)
* Unfold all lines (Win: Shift-Alt-0 Mac: Shift-Alt-Cmd-0)
* Search (Win: Ctrl-f, Mac: Cmd-f)
* Search & Replace (Win: Ctrl-f-f, Mac: Cmd-f-f)
* Undo edit (Win: Ctrl-z, Mac: Cmd-z)
* Redo edit (Win: Shift-Ctrl-z, Mac: Shift-Cmd-z)

You can also (un)fold lines using the small triangles next to the line numbers.

For additional shortcuts see:

<a href="https://github.com/ajaxorg/ace/wiki/Default-Keyboard-Shortcuts" target="_blank">https://github.com/ajaxorg/ace/wiki/Default-Keyboard-Shortcuts</a>

### R-functions

For an overview of related R-functions used by Radiant for decision analysis see <a href = "https://radiant-rstats.github.io/radiant.model/reference/index.html#section-model-decision-analysis" target="_blank">_Model > Decision analysis_</a>.

The key elements from the `data.tree` package used in the `dtree` tool are the `as.Node` function and the `Get` and `Do` methods.
