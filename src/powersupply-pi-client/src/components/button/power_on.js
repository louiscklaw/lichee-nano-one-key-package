import React, { Component } from 'react';

export default class PowerOn extends Component{
  render(){
    return (
      <div>
        <a href="http://192.168.99.250/cgi-bin/hello_json.sh?namex=on&namez=valuez&namey=valuey">on channel</a>
      </div>
    )
  }
}