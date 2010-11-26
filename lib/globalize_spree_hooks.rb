class GlobalizeSpreeHooks < Spree::ThemeSupport::HookListener
  # custom hooks go here
  replace :admin_product_form_left, 'admin/shared/product_globalize_form_left'
  replace :admin_inside_taxon_form, 'admin/shared/inside_taxon_globalize_form'
end