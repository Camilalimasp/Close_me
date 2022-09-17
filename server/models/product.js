const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: false,
    trim: true,
  },
  description: {
    type: String,
    required: false,
    trim: true,
  },
  quantity: {
    type: Number,
    required: false,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  price: {
    type: Number,
    required: false,
  },
});

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };
