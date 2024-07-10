Class {
	#name : #WsWindowComponentTest,
	#superclass : #WsComponentTest,
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsWindowComponentTest class >> componentClass [

	^ WsWindowComponent 
]

{ #category : #asserting }
WsWindowComponentTest >> assertClose [

	self assert:  (self allComponents includes: component).
	self clickElement: self closeButton.
	self deny: (self allComponents includes: component).

]

{ #category : #asserting }
WsWindowComponentTest >> assertComponent [

	self assertMinimizing.
	"self assertMaximizing."
	self assertClose.
]

{ #category : #asserting }
WsWindowComponentTest >> assertMaximizing [

		self deny: document fullscreenElement identicalTo: component.
		self clickElement: self maximizeButton.
		self assert: document fullscreenElement identicalTo: component.
		self clickElement: self maximizeButton.
		self deny: document fullscreenElement isNil.
		
]

{ #category : #asserting }
WsWindowComponentTest >> assertMinimizing [

	self assertShowing: self windowBody.
	self clickElement: self minimizeButton.
	self assertHidden: self windowBody.
	self clickElement: self minimizeButton.
	self assertShowing: self windowBody
]

{ #category : #accessing }
WsWindowComponentTest >> closeButton [

	^ shadowRoot querySelector: '.closeButton'
]

{ #category : #accessing }
WsWindowComponentTest >> maximizeButton [

	^ shadowRoot querySelector: '.maximizeButton'
]

{ #category : #accessing }
WsWindowComponentTest >> minimizeButton [

	^ shadowRoot querySelector: '.minimizeButton'
]

{ #category : #asserting }
WsWindowComponentTest >> windowBody [

	^ shadowRoot querySelector: '.windowBody'
]
