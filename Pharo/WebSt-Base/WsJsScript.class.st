"
I represent an external JS file.
"
Class {
	#name : #WsJsScript,
	#superclass : #WsLeafResource,
	#category : #'WebSt-Base-Resources'
}

{ #category : #adding }
WsJsScript >> addTo: resourceManager [

	resourceManager addGlobalResource: self
]

{ #category : #initialization }
WsJsScript >> renderTagOn: html [

	^ html script
		  defer;
		  type: 'text/javascript';
		  url: self url;
	  yourself
]
