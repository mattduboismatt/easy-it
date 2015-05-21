App.createController("Tickets", {
  actions: [
      { new: "setupForm" },
      { create: "setupForm" }
  ],

  setupForm: function() {
    this.cacheElements();
    this.registerEvents();
  },

  cacheElements: function() {
    this.serviceDropdown = $(".service-select");
    this.categoryDropdown = $(".category-select");
    this.serviceSelect = this.serviceDropdown.find("select");
    this.categorySelect = this.categoryDropdown.find("select");
  },

  registerEvents: function() {
    this.serviceDropdown.on("change", this.retrieveCategoryDropdown);
  },

  retrieveCategoryDropdown: function() {
    $.ajax({
      url: "/update_categories",
      data: {
        service: this.serviceSelect.val()
      },
    }).done(this.updateCategoryDropdown)
  },

  updateCategoryDropdown: function(categories) {
    options = "<option value>Select a Category</option>";
    categories.forEach( function(c) {
      option = "<option value="+c[1]+">"+c[0]+"</option>";
      options += option;
    });
    this.categorySelect.html(options);
  }
});