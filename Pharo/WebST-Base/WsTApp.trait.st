Trait {
	#name : #WsTApp,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsTApp classSide >> addAllComponentClassesTo: allComponentClasses [

	<pharoJsSkip>
self explicitRequirement 
]

{ #category : #accessing }
WsTApp classSide >> allComponentClasses [

	<pharoJsSkip>
	| allComponentClasses |
	allComponentClasses := IdentitySet new.
	self addAllComponentClassesTo: allComponentClasses.
	^ allComponentClasses asArray
]

{ #category : #accessing }
WsTApp classSide >> appClasses [

	<pharoJsSkip>
	^ super appClasses , self allComponentClasses 
]

{ #category : #accessing }
WsTApp classSide >> exporterClass [

	<pharoJsSkip>
	^ WsClientExporter
]

{ #category : #rendering }
WsTApp classSide >> html [

	<pharoJsSkip>
	^WsRenderer htmlFrom: self
]

{ #category : #rendering }
WsTApp classSide >> renderContentOn: html [

	<pharoJsSkip>
	self explicitRequirement 	
]

{ #category : #rendering }
WsTApp classSide >> renderOn: html [

	<pharoJsSkip>
	html renderAppClass: self
]

{ #category : #accessing }
WsTApp classSide >> title [

	<pharoJsSkip>
	^self name
]
