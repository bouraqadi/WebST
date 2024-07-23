Class {
	#name : 'WsListComponentTest',
	#superclass : 'WsMvcComponentTest',
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'testing' }
WsListComponentTest class >> isAbstract [ 
	^self == WsListComponentTest 
]

{ #category : 'asserting' }
WsListComponentTest >> assertViewMatchesModel [

	| itemModels itemComponents |
	itemModels := model items asLocalObject.
	itemComponents := (shadowRoot querySelectorAll:
			                  self itemComponentClass tagName) asLocalObject .
	itemModels with: itemComponents do: [ :aModel :itemComponent |
		self assertViewOf: itemComponent linkedToModel: aModel ]
]

{ #category : 'asserting' }
WsListComponentTest >> assertViewModelLink [

	self assertViewMatchesModel.
	self changeModelValues.
	self assertViewMatchesModel
]

{ #category : 'asserting' }
WsListComponentTest >> assertViewOf: itemComponent linkedToModel: itemModel [

	self assert: itemComponent model identicalTo: itemModel.
	self itemComponentAsserter assert: itemComponent
]

{ #category : 'asserting' }
WsListComponentTest >> changeModelValues [

	self subclassResponsibility
]

{ #category : 'asserting' }
WsListComponentTest >> itemComponentAsserter [
	^self subclassResponsibility 
]

{ #category : 'accessing' }
WsListComponentTest >> itemComponentClass [

	^ self rootComponentClass itemComponentClass
]

{ #category : 'accessing' }
WsListComponentTest >> itemElements [

	^ (shadowRoot querySelectorAll: #li) asLocalObject 
]
