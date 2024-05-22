Trait {
	#name : #WsTComponentApp,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsTComponentApp classSide >> allComponentClasses [

	<pharoJsSkip>
	| allComponentClasses |
	allComponentClasses := IdentitySet new.
	self rootComponentClass addAllComponentClassesTo: allComponentClasses.
	^ allComponentClasses asArray
]

{ #category : #description }
WsTComponentApp classSide >> appClasses [

	<pharoJsSkip>
	^ super appClasses , self allComponentClasses 
]

{ #category : #accessing }
WsTComponentApp classSide >> appExporterClass [

	^ WsExporter
]

{ #category : #accessing }
WsTComponentApp classSide >> bridgeClientClass [

	<pharoJsSkip>
	^ WsComponentBridgeClient
]

{ #category : #accessing }
WsTComponentApp classSide >> exporterClass [

	<pharoJsSkip>
	^ WsAppExporter
]

{ #category : #rendering }
WsTComponentApp classSide >> html [

	<pharoJsSkip>
	^WsRenderer htmlFrom: self
]

{ #category : #rendering }
WsTComponentApp classSide >> renderOn: html [

	<pharoJsSkip>
	html renderAppClass: self
]

{ #category : #rendering }
WsTComponentApp classSide >> rootComponentAttributes [

	<pharoJsSkip>
	^ #(  )
]

{ #category : #rendering }
WsTComponentApp classSide >> rootComponentClass [

	self explicitRequirement
]

{ #category : #rendering }
WsTComponentApp classSide >> title [

	<pharoJsSkip>
	^ self rootComponentClass title
]

{ #category : #initialization }
WsTComponentApp >> initRootComponent [

	^ self
]

{ #category : #initialization }
WsTComponentApp >> rootComponent [ 
	^self document querySelector:
		                 self rootComponentTagName.

]

{ #category : #accessing }
WsTComponentApp >> rootComponentClass [
	^self class rootComponentClass
]

{ #category : #accessing }
WsTComponentApp >> rootComponentTagName [
	^self rootComponentClass tagName
]

{ #category : #initialization }
WsTComponentApp >> start [

	self initRootComponent
]
