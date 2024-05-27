Trait {
	#name : #WsTViewBasedApp,
	#traits : 'WsTApp',
	#classTraits : 'WsTApp classTrait',
	#category : #'WebST-Base-Apps'
}

{ #category : #accessing }
WsTViewBasedApp classSide >> addAllComponentClassesTo: allComponentClasses [

	<pharoJsSkip>
	allComponentClasses addAll: self viewClass referencedComponentClasses 
]

{ #category : #rendering }
WsTViewBasedApp classSide >> renderContentOn: html [

	<pharoJsSkip>
	self viewClass renderOn: html
]

{ #category : #accessing }
WsTViewBasedApp classSide >> viewClass [

	<pharoJsSkip>
	self explicitRequirement 
]
