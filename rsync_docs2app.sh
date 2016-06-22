# rm -rf  ~/gh/radiant/inst/base/tools/help/figures/
rsync -av ~/gh/docs/data/app/  ~/gh/radiant.data/inst/app/tools/help/
rsync -av ~/gh/docs/data/figures/*  ~/gh/radiant.data/app/data/tools/help/figures/

rsync -av ~/gh/docs/design/app/  ~/gh/radiant.design/inst/app/tools/help/
rsync -av ~/gh/docs/design/figures_design/  ~/gh/radiant.design/inst/app/tools/help/figures/

rsync -av ~/gh/docs/basics/app/  ~/gh/radiant.basics/inst/app/tools/help/
rsync -av ~/gh/docs/basics/figures_basics/*  ~/gh/radiant.basics/inst/app/tools/help/figures/

rsync -av ~/gh/docs/model/app/  ~/gh/radiant.model/inst/app/tools/help/
rsync -av ~/gh/docs/model/figures_marketing/  ~/gh/radiant.model/inst/app/tools/help/figures/

rsync -av ~/gh/docs/multivariate/app/  ~/gh/radiant.multivariate/inst/app/tools/help/
rsync -av ~/gh/docs/multivariate/figures_multivariate/  ~/gh/radiant.multivariate/inst/app/tools/help/figures/

# rsync -nav ~/gh/radiant_gh-pages/base/app/  ~/gh/radiant/inst/base/tools/help/
# rsync -nav ~/gh/radiant_gh-pages/base/figures/  ~/gh/radiant/inst/base/tools/help/figures/

# rsync -nav ~/gh/radiant_gh-pages/quant/app/  ~/gh/radiant/inst/quant/tools/help/
# rsync -nav ~/gh/radiant_gh-pages/quant/figures_quant/  ~/gh/radiant/inst/quant/tools/help/figures/
#
# rsync -nav ~/gh/radiant_gh-pages/marketing/app/  ~/gh/radiant/inst/marketing/tools/help/
# rsync -nav ~/gh/radiant_gh-pages/marketing/figures_marketing/  ~/gh/radiant/inst/marketing/tools/help/figures/
#
# rsync -nav ~/gh/radiant_gh-pages/analytics/app/  ~/gh/radiant/inst/analytics/tools/help/
# rsync -nav ~/gh/radiant_gh-pages/analytics/figures_analytics/  ~/gh/radiant/inst/analytics/tools/help/figures/
#
