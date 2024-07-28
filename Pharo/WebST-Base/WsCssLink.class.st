"
I represent an external CSS file.
"
Class {
	#name : 'WsCssLink',
	#superclass : 'WsLeafResource',
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'initialization' }
WsCssLink >> addTo: resourceManager [
	"CSS needs to be added locally inside shadow DOM tree of components to be used by encapsulated HTML elements. It should also be added globally so CSS variables initialized by global JS scripts are set. Bootstrap is an example of where this happens."

	resourceManager
		addLocalResource: self;
		addGlobalResource: self
]

{ #category : 'initialization' }
WsCssLink >> renderTagOn: html [

	^ html link
		beStylesheet;
		url: self url;
		yourself
]
