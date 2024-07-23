Class {
	#name : 'WsToDoListComponentTest',
	#superclass : 'WsListComponentTest',
	#category : 'WebST-Tests-Examples',
	#package : 'WebST-Tests',
	#tag : 'Examples'
}

{ #category : 'accessing' }
WsToDoListComponentTest class >> componentClass [

	^ WsToDoListComponent 
]

{ #category : 'asserting' }
WsToDoListComponentTest >> assertViewModelLink [

	| itemsInitialCount |
	self assert: self headingDisplayContent equals: model heading.
	itemsInitialCount := model items size.
	3 timesRepeat: [ self clickAddItemButton ].
	self assert: model items size equals: itemsInitialCount + 3.
	super assertViewModelLink
]

{ #category : 'asserting' }
WsToDoListComponentTest >> changeModelValues [

	self evalBlock: [
		component addAllTexts: #( 'Butter' 'Milk' 'eggs' 'bread' 'Honey' ) ].
	component addText: 'Banans'.
	model items first isChecked: true.
	model items third isChecked: true.
	component heading: 'Another catchy title'
]

{ #category : 'asserting' }
WsToDoListComponentTest >> clickAddItemButton [

	^self clickElement: (shadowRoot querySelector: '.addItemButton')
]

{ #category : 'asserting' }
WsToDoListComponentTest >> headingDisplayContent [

	^ (shadowRoot querySelector: '.headingDisplay') textContent
]

{ #category : 'asserting' }
WsToDoListComponentTest >> itemComponentAsserter [

	^ WsToDoItemComponentTestAsserter
]
