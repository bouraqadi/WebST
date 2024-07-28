Trait {
	#name : 'WsTViewBasedApp',
	#traits : 'WsTApp',
	#classTraits : 'WsTApp classTrait',
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'rendering' }
WsTViewBasedApp classSide >> beforeRendering: rootView [

	<pharoJsSkip>
	^self
]

{ #category : 'analyzing' }
WsTViewBasedApp classSide >> findComponentClassesWith: aComponentClassFinder [

	<pharoJsSkip>
	aComponentClassFinder analyzeViewBasedAppClass: self
]

{ #category : 'rendering' }
WsTViewBasedApp classSide >> renderContentOn: html [

	<pharoJsSkip>
	self viewClass renderOn: html with: [ : view | self beforeRendering: view ]
]

{ #category : 'accessing' }
WsTViewBasedApp classSide >> viewClass [

	<pharoJsSkip>
	self explicitRequirement 
]
