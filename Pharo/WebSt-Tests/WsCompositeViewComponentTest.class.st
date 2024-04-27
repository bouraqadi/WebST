Class {
	#name : #WsCompositeViewComponentTest,
	#superclass : #WsComponentTest,
	#category : #'WebSt-Tests-Examples'
}

{ #category : #accessing }
WsCompositeViewComponentTest class >> componentClass [

	^ WsCompositeViewComponent
]

{ #category : #tests }
WsCompositeViewComponentTest >> assertAllLinksIn: container useHrefs: allHrefs [

		| allLinks |
	allLinks := container querySelectorAll: #link.
	allLinks asLocalObject with: allHrefs do: [ :link :expectedHref |
		self assert: (link href endsWith: expectedHref).
		self assert: link rel equals: 'stylesheet' ].

]

{ #category : #tests }
WsCompositeViewComponentTest >> assertComponent [

	| allScripts linkHrefs |
	self assert: (document body querySelectorAll: #script) isEmpty.
	allScripts := document head querySelectorAll: #script.
	allScripts asLocalObject
		with:
		#( 'jsABCD' 'jsA' 'jsY' 'jsA+B' 'jsX' 'jsC+D' 'jsC' 'index.js' )
		do: [ :script :expectedSrc |
			self assert: (script src endsWith: expectedSrc).
			self assert: script defer ].	
	linkHrefs := #( 'cssABCD' 'cssA' 'cssY' 'cssA+B' 'cssX' 'cssC+D'
	                'cssC' ).
	self assertAllLinksIn: document useHrefs: linkHrefs.
	self assertAllLinksIn: shadowRoot useHrefs: linkHrefs.
	self assert: (shadowRoot innerHTML endsWith: self displayHtml)
]

{ #category : #tests }
WsCompositeViewComponentTest >> displayHtml [

	^ String streamContents: [ :str |
		  #( 
		     '<h1>ABCD</h1>' '<h2>A+B</h2>' '<p>a</p>' '<p>b</p>' '<h2>C+D</h2>'
		     '<p>c</p>' '<p>d</p>' ) do: [ :each | str << each ] ]
]
