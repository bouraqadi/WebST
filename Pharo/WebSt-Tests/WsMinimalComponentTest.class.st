Class {
	#name : #WsMinimalComponentTest,
	#superclass : #WsComponentTest,
	#classTraits : 'PjTAppRunsInJS classTrait',
	#category : #'WebSt-Tests-Examples'
}

{ #category : #accessing }
WsMinimalComponentTest class >> componentClass [

	^ WsMinimalComponent 
]

{ #category : #tests }
WsMinimalComponentTest >> assertComponent [

	self assert: component innerHTML isEmpty.
	self assert: shadowRoot notNil.
	self assert: shadowRoot innerHTML isEmpty.
	self assert: component view identicalTo: shadowRoot
]
