Class {
	#name : #WsCompositeComponentTest,
	#superclass : #WsComponentTest,
	#instVars : [
		'intermediateComponent',
		'leafComponent'
	],
	#category : #'WebSt-Tests-Examples'
}

{ #category : #accessing }
WsCompositeComponentTest class >> componentClass [

	^ WsCompositeComponent
]

{ #category : #tests }
WsCompositeComponentTest >> assertComponent [

	self assertPageLinks.
	self assertPageScripts.
	self assertCompositeStructure.
	self assertIntermediateStructure.
	self assertLeafStructure
]

{ #category : #tests }
WsCompositeComponentTest >> assertCompositeStructure [

	| expectedCompositeDisplay |
	expectedCompositeDisplay := '<h1>Composite</h1><'
	                            , self intermediateTag , '></'
	                            , self intermediateTag , '>'.
	self
		assertShadowHtml: component
		linkHrefs: #( 'compositeCss' 'sharedCss' )
		display: expectedCompositeDisplay
]

{ #category : #tests }
WsCompositeComponentTest >> assertIntermediateStructure [

	| expectedIntermediateDisplay |
	expectedIntermediateDisplay := '<h2>Intermediate</h2><'
	                               , self leafTag , '></' , self leafTag
	                               , '>'.
	self
		assertShadowHtml: self intermediateComponent
		linkHrefs: #( 'intermediateCss' 'sharedCss' )
		display: expectedIntermediateDisplay
]

{ #category : #tests }
WsCompositeComponentTest >> assertLeafStructure [

	self
		assertShadowHtml: self leafComponent
		linkHrefs: #( 'leafCss' 'sharedCss' )
		display: '<p>leaf</p>'
]

{ #category : #tests }
WsCompositeComponentTest >> assertPageLinks [

	| allLinks |
	self assert: (document body querySelectorAll: #link) isEmpty.
	allLinks := document head querySelectorAll: #link.
	allLinks asLocalObject
		with: #( 'compositeCss' 'sharedCss' 'intermediateCss'
		   'leafCss' )
		do: [ :link :expectedHref |
			self assert: (link href endsWith: expectedHref) ]
]

{ #category : #tests }
WsCompositeComponentTest >> assertPageScripts [

	| allScripts |
	self assert: (document body querySelectorAll: #script) isEmpty.
	allScripts := document head querySelectorAll: #script.
	allScripts asLocalObject
		with:
		#( 'compositeJs' 'sharedJs' 'intermediateJs' 'leafJs' 'index.js' )
		do: [ :script :expectedSrc |
			self assert: (script src endsWith: expectedSrc).
			self assert: script defer ]
]

{ #category : #tests }
WsCompositeComponentTest >> assertShadowHtml: aComponent linkHrefs: linkHrefs display: htmlString [

	| dom allLinks |
	dom := aComponent view.
	allLinks := dom querySelectorAll: #link.
	allLinks asLocalObject with: linkHrefs do: [ :link :expectedHref |
		self assert: (link href endsWith: expectedHref).
		self assert: link rel equals: 'stylesheet' ].
	self assert: (dom innerHTML endsWith: htmlString)
]

{ #category : #accessing }
WsCompositeComponentTest >> intermediateComponent [ 
	^intermediateComponent ifNil: [intermediateComponent := shadowRoot querySelector:
		                         self intermediateTag].

]

{ #category : #accessing }
WsCompositeComponentTest >> intermediateTag [
	^WsIntermediateComponent tagName 
]

{ #category : #accessing }
WsCompositeComponentTest >> leafComponent [

	^ leafComponent ifNil: [	leafComponent := self intermediateComponent view querySelector:
		                         self leafTag .
]
]

{ #category : #accessing }
WsCompositeComponentTest >> leafTag [

	^ WsLeafComponent tagName
]
