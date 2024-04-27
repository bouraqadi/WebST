Trait {
	#name : #WsTComponentApp,
	#category : #'WebSt-Base-Apps'
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
WsTComponentApp classSide >> bridgeClientClass [

	<pharoJsSkip>
	^ WsComponentBridgeClient
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
