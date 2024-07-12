Class {
	#name : 'BaselineOfWebST',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfWebST',
	#package : 'BaselineOfWebST'
}

{ #category : 'baselines' }
BaselineOfWebST >> baseline: spec [

	<baseline>
	spec
		baseline: 'Seaside3' with: [
			spec
				repository: 'github://SeasideSt/Seaside:master/';
				loads: #( 'Seaside-Pharo-Canvas' 'Seaside-Tests-Pharo-Canvas'
					   'Javascript-Pharo-Core' 'Javascript-Tests-Pharo-Core' ) ];
		baseline: 'PharoJS'
		with: [ spec repository: 'github://PharoJS/PharoJS:pharo12/' ];
		baseline: 'HydrogenComponentsJS'
		with: [ spec repository: 'github://bouraqadi/PharoJsMisc:pharo12' ].

	spec
		package: 'WebST-Base'
		with: [
			spec requires: #( 'Seaside3' 'PharoJS' 'HydrogenComponentsJS' ) ];
		package: 'WebST-Library' with: [ spec requires: #( 'WebST-Base' ) ];
		package: 'WebST-Examples'
		with: [ spec requires: #( 'WebST-Base' 'WebST-Library' ) ];
		package: 'WebST-Tests'
		with: [
			spec requires: #( 'WebST-Base' 'WebST-Library' 'WebST-Examples' ) ]
]
