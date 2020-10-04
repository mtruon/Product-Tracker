import React, { Component } from 'react';
import ProductsTable from './ProductsTable';
import axios from 'axios'

class ProductModal extends Component {
  render() {
    const showHideClassName = this.props.show ? 'modal' : 'modal display-none';
    return(
      <div className={showHideClassName} tabIndex='-1' role='dialog'>
        test
      </div>
    );
  }
}

class ProductsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: props.products,
      showProductModal: false
    };
    this.handleSelect = this.handleSelect.bind(this);
  }

  showModal() {
    this.setState({ showProductModal: true });
  }

  hideModal() {
    this.setState({showProductModal: false});
  }

  handleSelect(e,product) {
    e.preventDefault();
    axios.get('http://localhost:3000/products/'+product.id)
    .then((data) => {
      this.showModal();
      // window.location = 'http://localhost:3000/products/'+product.id;
    })
    .catch((data) => {
      debugger
    });
    // console.log(this.props.prices[product.id]);
  }

  render() {
    return(
      <div>
        <ProductModal
          show={this.state.showProductModal}
          handleClose={this.hideModal} />
        <ProductsTable
          products={this.state.products}
          prices={this.props.prices}
          handleSelect={this.handleSelect} />
      </div>
    );
  }
}

export default ProductsContainer;
