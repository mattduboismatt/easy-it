// App.createController("Tickets", {
//   actions: [
//       { new: "setupForm" },
//       { create: "setupForm" }
//   ],

//   setupForm: function() {
//     this.cacheElements();
//     this.registerEvents();
//   },

//   cacheElements: function() {
//     this.serviceDropdown = $(".service-select");
//     this.categoryDropdown = $(".category-select");
//     this.serviceSelect = this.serviceDropdown.find("select");
//     this.categorySelect = this.categoryDropdown.find("select");
//   },

//   registerEvents: function() {
//     this.serviceDropdown.on("change", this.updateCategoryDropdown);
//   },

//   updateCategoryDropdown: function() {
//     $.ajax({
//       url: "/update_categories",
//       data: {
//         service : this.serviceSelect.val()
//       },
//       dataType: "script"
//     }); 
//   }
// });
