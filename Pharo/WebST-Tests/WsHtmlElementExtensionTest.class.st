Class {
	#name : 'WsHtmlElementExtensionTest',
	#superclass : 'WsMinimalComponentTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsHtmlElementExtensionTest >> testHideShow [

	| button |
	button := document createElement: 'button'.
	button textContent: 'testHideShow'.
	document body prepend: button.
	3 timesRepeat: [
		self waitUntil: [ button isShowing ].
		self deny: button isHidden.
		self deny: button computedDisplayStyle equals: 'none'.
		button hide.
		self waitUntil: [ button isHidden ].
		self deny: button isShowing.
		self assert: button computedDisplayStyle equals: 'none'.
		button show ]
]
