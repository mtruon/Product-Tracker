import React, { Component } from 'react'

class ProductRow extends Component {
  render() {
    const product = this.props.product;
    console.log(product);
    return(
      <tr>
        <td>{product.name}</td>
        <td>{product.current_price}</td>
        <td></td>
        <td></td>
      </tr>
    )
  }
}

class ProductTable extends Component {
  constructor(props) {
    super(props);
    this.state = {
      products: props.products
    };
    console.log(this.state.products);
  }

  render() {
    const rows = [];
    this.props.products.forEach((product) => {
      rows.push(
        <ProductRow
          product={product}
          key={product.name} />
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

export default ProductTable;
