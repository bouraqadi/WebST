Trait {
	#name : #WsTApp,
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsTApp classSide >> allComponentClasses [

	<pharoJsSkip>
	^WsComponentClassFinder allComponentClassesFrom: self
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

{ #category : #analyzing }
WsTApp classSide >> findComponentClassesWith: aComponentClassFinder [

	<pharoJsSkip>
	self explicitRequirement 
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
