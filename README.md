# WebST = Web Components with Smalltalk
<img align="left" src="Images/webST-logo717x784.png" width="100px">

WebST is a framework for building [Web Components](https://www.webcomponents.org/) using [PharoJS](https://github.com/PharoJS/PharoJS). 
Each web component can be used via a custom HTML tag (e.g. `<ws-counter>`). When you use a custom tag in your HTML code, the web browser creates a DOM object that is an instance of a component class which defines the appearance and the behavior provided by the developer.

Component classes are subclasses of `WsComponent`. A component class defines the behavior of web components.
The look, i.e. HTML, is defined using a subclass to `WsView` referenced in a component class side method `viewClass`.

In most WebST examples, component classes are defined as subclasses of `WsMvcComponent`. 
They override class side method `modelClass`.
As suggested by its name, this method answers the class of the model used by the component.

## Install

To install any of the projects below evaluate the following expression in a Playground, where `PROJECT_NAME` is replaced by the project you want to install.
```Smalltalk
Metacello new
  baseline: 'WebST';
  repository: 'github://bouraqadi/WebST:pharoXX';
  load
 ```
Where XX is your Pharo image version number. Each supported Pharo version has a dedicated branch.


## Talk at the ESUG International Conference, Lille, France, July 2024
<p align="center"><a href="https://nootrix.com/tutorials/webst-web-components-with-smalltalk-esug-2024-in-lille-france/"><img align="center" src="Images/webSt-pharo-htmlCsJs-w1000.jpg" width="400px"></a></p>
