Class {
	#name : 'WsViewNotRenderingSubComponent',
	#superclass : 'WsView',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'rendering' }
WsViewNotRenderingSubComponent >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'View Using Component but Not rendering.'.
	html div with: [WsLeafComponent name]
]

{ #category : 'accessing' }
WsViewNotRenderingSubComponent >> resources [

	^ {
		  (WsCssLink url: 'intermediateCss').
		  (WsJsScript url: 'intermediateJs').
		  (WsCssLink url: 'sharedCss').
		  (WsJsScript url: 'sharedJs') }
]
