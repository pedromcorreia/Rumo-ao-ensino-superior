exports.config = {
  files: {
    javascripts: {
      joinTo: "js/app.js"
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["/css/app.scss"]
      },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
   assets: /^(static)/
  },

  paths: {
    watched: ["static", "css", "js", "vendor"],
    public: "..priv/static"
  },

  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    },
    sass: {
      options: {
        includePaths: ["node_modules/bootstrap/scss", "node_modules/font-awesome/scss"], // Tell sass-brunch where to look for files to @import
        precision: 8 // Minimum precision required by bootstrap-sass
      }
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      jQuery: 'jquery',
      bootstrap: 'bootstrap' // Require Bootstrap's JavaScript globally
    }
  }
};
