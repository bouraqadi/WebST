Class {
	#name : 'WsCompositeInitSubView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsCompositeInitSubView class >> subViewTextContent [
	^'Some text for sub view provided by composite'
]

{ #category : 'rendering' }
WsCompositeInitSubView >> renderOuterHtmlOn: html [

	html
		render: WsInitializableSubView
		with: [ :view | view textContent: self subViewTextContent ]
]

{ #category : 'rendering' }
WsCompositeInitSubView >> subViewTextContent [
	^self class subViewTextContent
]
