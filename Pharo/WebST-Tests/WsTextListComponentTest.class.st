Class {
	#name : #WsTextListComponentTest,
	#superclass : #WsListComponentTest,
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsTextListComponentTest class >> componentClass [

	^ WsTextListComponent 
]

{ #category : #asserting }
WsTextListComponentTest >> changeModelValues [

	self evalBlock: [
		component addAllTexts:
			#( 'May the force be with you' 'Jedi Master' 'R2D2 droid'
			   'light saber' )].
	component addText: 'Star Wars'.
]

{ #category : #asserting }
WsTextListComponentTest >> itemComponentAsserter [

	^ WsTextComponentTestAsserter 
]
