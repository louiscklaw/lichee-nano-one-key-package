import React, { Component } from 'react';

export default class PowerOff extends Component{
  render(){
    return (
      <div>
        <a href="http://192.168.99.250/cgi-bin/hello_json.sh?namex=off&namez=valuez&namey=valuey">off channel</a>
      </div>
    )
  }
}