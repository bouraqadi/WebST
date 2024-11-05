Trait {
	#name : 'WsTSingleComponentApp',
	#traits : 'WsTApp',
	#classTraits : 'WsTApp classTrait',
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'rendering' }
WsTSingleComponentApp classSide >> componentClass [

	self explicitRequirement
]

{ #category : 'analyzing' }
WsTSingleComponentApp classSide >> findComponentClassesWith: aComponentClassFinder [

	<pharoJsSkip>
	aComponentClassFinder analyzeSingleComponentAppClass: self
]

{ #category : 'rendering' }
WsTSingleComponentApp classSide >> renderContentOn: html [

	<pharoJsSkip>
	html render: self componentClass with: [ :brush |
		brush dataAttributes: self rootComponentAttributes.
		brush style: self rootComponentStyle.
		brush class: self rootComponentCssClasses ]
]

{ #category : 'rendering' }
WsTSingleComponentApp classSide >> rootComponentAttributes [

	<pharoJsSkip>
	^ #(  )
]

{ #category : 'rendering' }
WsTSingleComponentApp classSide >> rootComponentCssClasses [

	<pharoJsSkip>
	^ nil
]

{ #category : 'rendering' }
WsTSingleComponentApp classSide >> rootComponentStyle [

	<pharoJsSkip>
	^ nil
]

{ #category : 'accessing' }
WsTSingleComponentApp >> componentClass [
	^self class componentClass
]

{ #category : 'initialization' }
WsTSingleComponentApp >> initRootComponent [

	^ self
]

{ #category : 'initialization' }
WsTSingleComponentApp >> rootComponent [ 
	^self document querySelector:
		                 self rootComponentTagName.

]

{ #category : 'accessing' }
WsTSingleComponentApp >> rootComponentTagName [
	^self componentClass tagName
]

{ #category : 'initialization' }
WsTSingleComponentApp >> start [

	self initRootComponent
]
