import React, { Component } from 'react'

class ProductRow extends Component {
  render() {
    const product = this.props.product;
    const price = this.props.price;
    // console.log(product);
    return(
      <tr onClick={(e) => this.props.handleSelect(e, product)} data-id={product.id}>
        <td>{product.name}</td>
        <td>{price["current"]}</td>
        <td>{price["max"]}</td>
        <td>{price["min"]}</td>
      </tr>
    )
  }
}

class ProductsTable extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: props.products
    };
    // console.log(this.state.products);
  }

  render() {
    const rows = [];
    this.props.products.forEach((product) => {
      rows.push(
        <ProductRow
          product={product}
          price={this.props.prices[product.id]}
          key={product.name}
          handleSelect={this.props.handleSelect}/>
      );
    });

    return(
      <div className='row shadow-lg border bg-white px-2 py-0 rounded-lg'>
        <table className='table table-hover'>
          <thead>
            <tr>
              <th>Name</th>
              <th>Current Price</th>
              <th>High</th>
              <th>Low</th>
            </tr>
          </thead>
          <tbody>
            {rows}
          </tbody>
        </table>
      </div>
    );
  }
}

export default ProductsTable;
