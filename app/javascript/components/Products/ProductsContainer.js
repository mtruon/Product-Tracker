import React, { Component } from 'react';
import ProductsTable from './ProductsTable';

class ProductsContainer extends Component {
  constructor(props) {
    super(props);
    // Maybe some state stuff
  }
  render() {
    return(
      <div>
        <ProductsTable/>
      </div>
    );
  }
}

export default ProductsContainer;
