Class {
	#name : 'WsWebBackComponent',
	#superclass : 'WsIconTextComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'webHistoryController'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsWebBackComponent class >> defaultIconAttribute [

	^ 'bi-arrow-left'
]

{ #category : 'initialization' }
WsWebBackComponent >> initializeOnDomConnection [
	"The connectedCallback(): called each time the element is added to the document. The specification recommends that, as far as possible, developers should implement custom element setup in this callback rather than the constructor. "
	"See https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_element_lifecycle_callbacks"
	<jsAlias: #connectedCallback>

	super initializeOnDomConnection.
	webHistoryController := WsWebHistoryController new.
	webHistoryController makeBackButton: self.

	
]
