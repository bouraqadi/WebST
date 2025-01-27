Class {
	#name : 'WsMvcComponent',
	#superclass : 'WsComponent',
	#instVars : [
		'model'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'instance creation' }
WsMvcComponent class >> model: aModel [

	^ self basicNew
		  model: aModel;
		  yourself
]

{ #category : 'accessing' }
WsMvcComponent class >> modelClass [

	self subclassResponsibility
]

{ #category : 'instance creation' }
WsMvcComponent class >> newModel [

	^self modelClass new
]

{ #category : 'initialization' }
WsMvcComponent >> initModel [

	^ self 
]

{ #category : 'initialization' }
WsMvcComponent >> initializeOnDomConnection [
	"The connectedCallback(): called each time the element is added to the document. The specification recommends that, as far as possible, developers should implement custom element setup in this callback rather than the constructor. "
	"See https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_element_lifecycle_callbacks"
	<jsAlias: #connectedCallback>

	super initializeOnDomConnection.
	self model: self newModel.

]

{ #category : 'accessing' }
WsMvcComponent >> model [

	^ model
]

{ #category : 'initialization' }
WsMvcComponent >> model: aModel [

	(model notNil or: [view isNil]) ifTrue: [ self resetView ].
	model := aModel.
	self initModel
]

{ #category : 'initialization' }
WsMvcComponent >> newModel [
	^self class newModel
]
