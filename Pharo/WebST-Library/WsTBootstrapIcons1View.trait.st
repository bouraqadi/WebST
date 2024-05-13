Trait {
	#name : #WsTBootstrapIcons1View,
	#instVars : [
		'iconCssClass'
	],
	#category : #'WebST-Library-Bootstrap'
}

{ #category : #'instance creation' }
WsTBootstrapIcons1View classSide >> iconCssClass: iconCssClass [
	^self new
		iconCssClass: iconCssClass;
		yourself
]

{ #category : #accessing }
WsTBootstrapIcons1View >> iconCssClass [

	^ iconCssClass 
]

{ #category : #accessing }
WsTBootstrapIcons1View >> iconCssClass: anObject [

	iconCssClass := anObject
]

{ #category : #rendering }
WsTBootstrapIcons1View >> renderOuterHtmlOn: html [

		html icon class: 'bi ' , self iconCssClass 
]

{ #category : #accessing }
WsTBootstrapIcons1View >> resources [

	^ {WsBootstrapResources bootstrapIcons1}
]
