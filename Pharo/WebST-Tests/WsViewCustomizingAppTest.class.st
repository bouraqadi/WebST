Class {
	#name : 'WsViewCustomizingAppTest',
	#superclass : 'PjWebAppTestCase',
	#category : 'WebST-Tests-ViewCustomization',
	#package : 'WebST-Tests',
	#tag : 'ViewCustomization'
}

{ #category : 'suite parameters' }
WsViewCustomizingAppTest class >> appClass [

	^ WsViewCustomizingApp
]

{ #category : 'tests' }
WsViewCustomizingAppTest >> testViewCustomized [
	| view |
	view := document querySelector: 'p'.
	self assert: view textContent equals: self appClass viewTextContent 
]
