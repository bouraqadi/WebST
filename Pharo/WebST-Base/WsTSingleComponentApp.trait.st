Trait {
	#name : #WsTSingleComponentApp,
	#traits : 'WsTApp',
	#classTraits : 'WsTApp classTrait',
	#category : #'WebST-Base-Apps'
}

{ #category : #analyzing }
WsTSingleComponentApp classSide >> findComponentClassesWith: aComponentClassFinder [

	<pharoJsSkip>
	aComponentClassFinder analyzeSingleComponentAppClass: self
]

{ #category : #testing }
WsTSingleComponentApp classSide >> isHtmlGenerator [

	<pharoJsSkip>
	^ true
]

{ #category : #rendering }
WsTSingleComponentApp classSide >> renderContentOn: html [

	<pharoJsSkip>
	html
		render: self rootComponentClass
		dataAttributes: self rootComponentAttributes.

]

{ #category : #rendering }
WsTSingleComponentApp classSide >> rootComponentAttributes [

	<pharoJsSkip>
	^ #(  )
]

{ #category : #rendering }
WsTSingleComponentApp classSide >> rootComponentClass [

	self explicitRequirement
]

{ #category : #initialization }
WsTSingleComponentApp >> initRootComponent [

	^ self
]

{ #category : #initialization }
WsTSingleComponentApp >> rootComponent [ 
	^self document querySelector:
		                 self rootComponentTagName.

]

{ #category : #accessing }
WsTSingleComponentApp >> rootComponentClass [
	^self class rootComponentClass
]

{ #category : #accessing }
WsTSingleComponentApp >> rootComponentTagName [
	^self rootComponentClass tagName
]

{ #category : #initialization }
WsTSingleComponentApp >> start [

	self initRootComponent
]
