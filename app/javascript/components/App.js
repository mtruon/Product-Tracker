import React, { Component } from 'react'
import ProductsContainer from './Products/ProductsContainer'
import axios from 'axios'

class App extends Component {
    render() {
        return(
          <ProductsContainer
          products={this.props.products}
          prices={this.props.prices}/>
        );
    }
}

export default App;
