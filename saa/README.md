# Examples City Archives Amsterdam
The example is very simple and preliminary! It is used to learn about RiC-O and contains no decisions on mappings between EAD elements and RiC-O properties.

## Example complete Finding Aid
30157-9.ttl, created with XSLT stylesheet.

### Assumptions
* EAD contains no @level='item'
* @id of the component is in the ead:did-element (although it identifies extra-did data too ...)

### Lessons learned
* most Dutch Finding Aids do not contain rico:Record.

### XSLT transformation EAD into RDF/XML
We use xmllint to convert an example EAD file into RDF and test the resulting RDF/XML by parsing it with raptor.

```
xsltproc ead2rico.xslt 30157-9.ead.xml > 30157-9.rdf.xml
rapper -o turtle 30157-9.rdf.xml > 30157-9.ttl
```

## Example with rico:Record, rico:Instantiation and roar:PersonObservation
personobservation.ttl, handmade. Real example, but mostly fictional numbers.
