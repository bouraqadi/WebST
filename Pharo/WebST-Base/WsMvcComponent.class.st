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

	^ self new
		  basicModel: aModel;
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

{ #category : 'accessing' }
WsMvcComponent >> basicModel: aModel [

	model := aModel
]

{ #category : 'initialization' }
WsMvcComponent >> initModel [

	^ self 
]

{ #category : 'initialization' }
WsMvcComponent >> initializeOnDomConnection [

	super initializeOnDomConnection.
	"Don't create a model if one is provided upon creation by the class side #model: constructor method"
	model ifNil: [ model := self newModel ].
	self initModel
]

{ #category : 'accessing' }
WsMvcComponent >> model [

	^ model
]

{ #category : 'initialization' }
WsMvcComponent >> model: aModel [

	self resetView.
	model := aModel.
	self initModel
]

{ #category : 'initialization' }
WsMvcComponent >> newModel [
	^self class newModel
]
