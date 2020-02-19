import React, { Component } from 'react'
import ProductsContainer from './Products/ProductsContainer'

class App extends Component {
    render() {
        return(
          <ProductsContainer products={this.props.products}/>
        );
    }
}

export default App;
