"
I represent an external JS file.
"
Class {
	#name : 'WsJsScript',
	#superclass : 'WsLeafResource',
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'adding' }
WsJsScript >> addTo: resourceManager [

	resourceManager addGlobalResource: self
]

{ #category : 'initialization' }
WsJsScript >> renderTagOn: html [

	^ html script
		  defer;
		  type: 'text/javascript';
		  url: self url;
	  yourself
]
