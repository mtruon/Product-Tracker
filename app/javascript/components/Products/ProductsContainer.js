import React, { Component } from 'react';
import ProductsTable from './ProductsTable';
import axios from 'axios'

class ProductsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: props.products
    }
    // Maybe some state stuff
    this.handleSelect = this.handleSelect.bind(this);
  }

  handleSelect(e,product) {
    e.preventDefault();
    axios.get('http://localhost:3000/products/'+product.id)
    .then((data) => {
      window.location = 'http://localhost:3000/products/'+product.id;
    })
    .catch((data) => {
      debugger
    });
    // console.log(this.props.prices[product.id]);
  }

  render() {
    return(
      <div>
        <ProductsTable
          products={this.state.products}
          prices={this.props.prices}
          handleSelect={this.handleSelect}/>
      </div>
    );
  }
}

export default ProductsContainer;
