# WebST = Web Components with Smalltalk
WebST is a framework for building [Web Components](https://www.webcomponents.org/) using [PharoJS](https://github.com/PharoJS/PharoJS). 
Each web component can be used via a custom HTML tag (e.g. <ws-counter>). When you use a custom tag in your HTML code, the web browser creates a DOM object that is an instance of a component class which defines the appearance and the behavior provided by the developer.

Component classes are subclasses of `WsComponent`. A component class defines the behavior of web components.
The look, i.e. HTML, is defined using a subclass to `WsView` referenced in a component class side method `viewClass`.

In most WebST examples, component classes are defined as subclasses of `WsMvcComponent`. 
They override class side method `modelClass`.
As suggested by its name, this method answers the class of the model used by the component.
