import React, { Component } from 'react'

class ProductsTable extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Current Price</th>
              <th>High</th>
              <th>Low</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    );
  }
}

export default ProductsTable;
