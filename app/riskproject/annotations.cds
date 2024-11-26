using RiskService as service from '../../srv/risk-service';
annotate service.Risks with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'owner',
                Value : owner,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prio_code',
                Value : prio_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'descr',
                Value : descr,
            },
            {
                $Type : 'UI.DataField',
                Label : 'impact',
                Value : impact,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PrioCriticality',
                Value : PrioCriticality,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : 'grp-RiskTab',
            ID : 'grpRiskTab',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'frm1risk',
                    ID : 'frm1risk',
                    Target : '@UI.FieldGroup#frm1risk',
                },
            ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'grp2-MitigationTab',
            ID : 'grp2MitigationTab',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'frm2mitigation',
                    ID : 'frm2mitigation',
                    Target : '@UI.FieldGroup#frm2mitigation',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Owner',
            Value : owner,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Priority',
            Value : prio_code,
            Criticality : PrioCriticality,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Impact',
            Value : impact,
            Criticality : criticality,
        },
        {
            $Type : 'UI.DataField',
            Value : miti.descr,
            Label : 'Mitigation',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@Communication.Contact#contact',
            Label : 'Business Partner',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'bp/@Communication.Contact#contact2',
            Label : 'Contact Name',
        },
    ],
    UI.SelectionFields : [
        prio_code,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : descr,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.FieldGroup #frm1risk : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'Title',
            },
            {
                $Type : 'UI.DataField',
                Value : owner,
                Label : 'Owner',
            },
            {
                $Type : 'UI.DataField',
                Value : descr,
                Label : 'Descr',
            },
            {
                $Type : 'UI.DataField',
                Value : prio_code,
                Criticality : PrioCriticality,
            },
            {
                $Type : 'UI.DataField',
                Value : impact,
                Label : '{i18n>Impact}',
                Criticality : criticality,
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@Communication.Contact#contact1',
                Label : 'Contact Name',
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'bp/@Communication.Contact#contact3',
                Label : 'Contact Name',
            },
        ],
    },
    UI.FieldGroup #frm2mitigation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : miti.descr,
                Label : 'Mitigation',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.owner,
                Label : 'Owner',
            },
            {
                $Type : 'UI.DataField',
                Value : miti.timeline,
                Label : 'Timeline',
            },
        ],
    },
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : bp_BusinessPartner,
    },
);

annotate service.Risks with {
    miti @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Mitigations',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : miti_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'descr',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'owner',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'timeline',
            },
        ],
    }
};

annotate service.Risks with {
    prio @(
        Common.Label : 'Priority',
        Common.Text : {
            $value : prio.descr,
            ![@UI.TextArrangement] : #TextOnly
        },
    )
};

annotate service.BusinessPartners with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact2 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
    Communication.Contact #contact3 : {
        $Type : 'Communication.ContactType',
        fn : FullName,
    },
);

