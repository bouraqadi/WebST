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
		basicModel: aModel;
		initialize;
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
WsMvcComponent >> ensureModel [
	"Don't create a model if one is provided upon creation by the class side #model: constructor method"
	self model ifNotNil: [^self].
	self initializeModel
]

{ #category : 'initialization' }
WsMvcComponent >> getReady [ 
	super getReady.
	self ensureModel.

]

{ #category : 'initialization' }
WsMvcComponent >> initializeModel [
	self basicModel: self newModel

]

{ #category : 'accessing' }
WsMvcComponent >> model [

	^ model
]

{ #category : 'initialization' }
WsMvcComponent >> model: aModel [

	self basicModel: aModel.
	self reset
]

{ #category : 'initialization' }
WsMvcComponent >> newModel [
	^self class newModel
]
