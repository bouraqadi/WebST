Class {
	#name : #WsDependantViewComponentTest,
	#superclass : #WsComponentTest,
	#category : #'WebSt-Tests-Examples'
}

{ #category : #accessing }
WsDependantViewComponentTest class >> componentClass [

	^ WsDependantViewComponent
]

{ #category : #tests }
WsDependantViewComponentTest >> assertComponent [

	| scripts jsDependency mainJs link |
	self assert: shadowRoot innerHTML equals: self shadowHtml.
	self assert: (document head querySelectorAll: #link) size equals: 1.
	link := (document head querySelectorAll: #link) first.
	self assert: (link href endsWith: 'requiredCSS').
	self assert: (document body querySelectorAll: #script) isEmpty.
	scripts := document head querySelectorAll: #script.
	self assert: scripts size equals: 2.
	jsDependency := scripts first.
	self assert: (jsDependency src endsWith: 'requiredJS').
	self assert: jsDependency defer.
	mainJs := scripts last.
	self assert: (mainJs src endsWith: 'index.js').
	self assert: mainJs defer
]

{ #category : #tests }
WsDependantViewComponentTest >> shadowHtml [

	^ '<link rel="stylesheet" href="requiredCSS"><p>some text</p>'
]
