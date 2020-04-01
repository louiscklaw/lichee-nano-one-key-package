import React, { Component } from 'react';

export default class PowerOff extends Component{
  render(){
    return (
      <div>
        <a href="http://192.168.99.250/cgi-bin/hello_uart_off">off channel</a>
      </div>
    )
  }
}