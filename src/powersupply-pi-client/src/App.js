import React from 'react';

import {PowerOn, PowerOff} from './components/button';
import { VoltageInput, CurrentInput } from './components/value_input';

function App() {
  return (
    <div className="App">
      openDPS tryout

      <table>
        <tr><td>channel 1</td></tr>
        <tr><td>power on</td></tr>
        <tr><td><PowerOn></PowerOn></td></tr>
        <tr><td>power off</td></tr>
        <tr><td><PowerOff></PowerOff></td></tr>

        <tr><td>voltage input</td></tr>
        <tr><td><VoltageInput></VoltageInput></td></tr>

        <tr><td>current input</td></tr>
        <tr><td><CurrentInput></CurrentInput></td></tr>

        <tr><td>channel 2</td></tr>
        <tr><td>power on</td></tr>
        <tr><td><PowerOn></PowerOn></td></tr>
        <tr><td>power off</td></tr>
        <tr><td><PowerOff></PowerOff></td></tr>

        <tr><td>voltage input</td></tr>
        <tr><td><VoltageInput></VoltageInput></td></tr>

        <tr><td>current input</td></tr>
        <tr><td><CurrentInput></CurrentInput></td></tr>

      </table>

    </div>
  );
}

export default App;
