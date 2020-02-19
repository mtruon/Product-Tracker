import React, { Component } from 'react';
import ProductsTable from './ProductsTable';

class ProductsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: props.products
    }
    console.log(this.state.products);
    // Maybe some state stuff
  }
  render() {
    return(
      <div>
        <ProductsTable products={this.state.products}/>
      </div>
    );
  }
}

export default ProductsContainer;
