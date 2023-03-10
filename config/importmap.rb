pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", proload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", proload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.min.js", proload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "slim-select", to: "https://ga.jspm.io/npm:slim-select@1.27.1/dist/slimselect.min.mjs"
pin "trix"
pin "@rails/actiontext", to: "actiontext.js"
