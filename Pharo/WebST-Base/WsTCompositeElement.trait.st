Trait {
	#name : 'WsTCompositeElement',
	#instVars : [
		'children'
	],
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'accessing' }
WsTCompositeElement >> add: aChild [

	self children add: aChild
]

{ #category : 'accessing' }
WsTCompositeElement >> addAll: newChildren [

	self children addAll: newChildren
]

{ #category : 'accessing' }
WsTCompositeElement >> children [
	^children ifNil: [ children := OrderedCollection new ]
]

{ #category : 'rendering' }
WsTCompositeElement >> renderChildrenOn: html [

	self children do: [ :each | html render: each ]
]

{ #category : 'rendering' }
WsTCompositeElement >> renderOuterHtmlOn: html [

	self renderChildrenOn: html
]
